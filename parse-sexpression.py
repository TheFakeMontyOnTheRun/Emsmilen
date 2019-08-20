from sexpdata import loads, Symbol
import sys

operands_per_instructions = {
    "i32.load8_s" : 0,
    "i32.load8_u" : 0,
    "i32.get" : 1,
    "func" : 1,
    "local.get" : 1,
    "i32.const" : 1,
    "i64.const" : 1,
    "i32.add" : 0,
    "global.get" : 1,
    "i32.sub" : 0,
    "block" : 0,
    "end" : 0,
    "i32.le_u" : 0,
    "i32.gt_u": 0,
    "i32.ge_u": 0,
    "i32.load" : 0,
    "i64.load" : 0,
    "i32.and" : 0,
    "i32.lt_u": 0,
    "i32.shr_u": 0,
    "i32.shl": 0,
    "offset=": 1,
    "align=": 1,
    "i32.xor": 0,
    "i32.eq": 0,
    "i32.eqz": 0,
    "i32.ne": 0,
    "i32.or": 0,
    "i32.rotl": 0,
    "i32.store": 0,
    "i64.store": 0,
    "select": 0,
    "if" : 0,
    "else" : 0,
    "loop" : 0,
    "drop" : 0,
    "return" : 0,
    "memory.grow" : 0,
    "unreachable" : 0,
    "local.tee" : 1,
    "local.set" : 1,
    "br": 1,
    "call": 1,
    "br_if": 1,
    "global.set" : 1,
}


class TypeName:

    name = None

    def __init__(self, val):
        self.name = val

void_type = TypeName("void")

class ValueTypeDefinition:
    name = None
    TypeName = None

class FunctionType:
    parameters = []
    returnType = void_type

class Function:
    name = ""
    functionType = None

def is_list(possible_list):
    att = dir(possible_list)

    if isinstance(possible_list, str):
        return False

    for i in att:
        if i is "__len__":
            return True

    return False

def get_atom_value(node):
    if isinstance(node, str):
        return node

    if isinstance(node, int):
        return str(node)

    if not is_list(node):
        return str(node.value())

    return ""


def parse_result_declaration(param_declaration):

    for node in param_declaration:
        if param_declaration.index(node) != 0:
            return get_atom_value(node)

    return None

def parse_parameter_declaration(param_declaration):
    param_list = []

    for node in param_declaration:
        if param_declaration.index(node) != 0:
            param_list.append(get_atom_value(node))


    return param_list

def parse_function_declaration(type_def):

    func = FunctionType()

    for node in type_def:
        if is_list(node) and len(node) > 0:
            if get_atom_value(node[0]) == "param":
                func.parameters = parse_parameter_declaration(node)

            if get_atom_value(node[0]) == "result":
                func.returnType = parse_result_declaration(node)

    return func


exports = dict()
declared_func_types = dict()

def emit_pop(size):
    print( "POP " + str(size) )

def emit_pop_pc():
    print("_PC = stack_top()")
    print("POP 4")
    print("goto _PC")

def parameters_size( functype ):
    total = 0

    for param in functype.parameters:
        total += 4 if param == "i32" else 8

    return total

def do_nothing_for_now():
    bla = 0

def generate_function(func_node):

    func_type = None
    buffered_nodes = []
    pending_operands = 0

    for node in func_node:
        if is_list(node) and len(node) > 0:
            if get_atom_value(node[0]) == "param":
                if func_type is None:
                    func_type = FunctionType()
                    func_type.parameters = parse_parameter_declaration(node)

                do_nothing_for_now()
            elif get_atom_value(node[0]) == "result":
                do_nothing_for_now()
            elif get_atom_value(node[0]) == "type":
                func_index = get_atom_value( node[1] )

                if func_index in declared_func_types:
                    func_type = declared_func_types[func_index]

            elif get_atom_value(node[0]) == "local":
                do_nothing_for_now()
            elif get_atom_value(node[0]).startswith(";"):
                continue
            else:
                print( get_atom_value( node ) )
        else:
            atom_value = get_atom_value(node)

            if atom_value.startswith(";"):
                print("Line comments are not supported for now - sorry")
                exit(-1)

            if len(buffered_nodes) == 0:
                if atom_value not in operands_per_instructions:
                    print("instruction not handled: " + atom_value )
                    exit(-1)

                pending_operands = operands_per_instructions[atom_value]
                buffered_nodes.append(atom_value)
            else:
                pending_operands = pending_operands - 1
                buffered_nodes.append(atom_value)


            if pending_operands == 0:
                for operand in buffered_nodes:
                    sys.stdout.write(operand + " " )

                print()
                buffered_nodes = []



def print_list(nodes, path):

    if path == "/module/export":
        exports[ get_atom_value( nodes[2][1] ) ] = get_atom_value( nodes[1] )


    if path == "/module/func":
        func_def = get_atom_value( nodes[1] )

        if func_def in exports:
            print("function definition:" + exports[func_def])

        generate_function( nodes )
        return

    if path == "/module/type" and get_atom_value( nodes[2][0] ) == "func":
        declared_func_types[get_atom_value(nodes[1])] = parse_function_declaration(nodes[2])
        return;


    for node in nodes:

        if nodes.index(node) != 0:

            if is_list(node) and len(node) > 0:

                newPath = path + "/" + get_atom_value(node[0])

                print_list(node, newPath)
            else:
                print(path + "/" + get_atom_value(node))

with open('simple.dis', 'r') as myfile:
    data = myfile.read()
    sexp = loads(data, nil='nop', true='true', false='false', line_comment=';;')
    print_list(sexp, "/" + get_atom_value(sexp[0]))

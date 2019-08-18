from sexpdata import loads, Symbol

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
declared_funcs = dict()


def print_list(nodes, path):

    if path == "/module/export":
        exports[ get_atom_value( nodes[2][1] ) ] = get_atom_value( nodes[1] )


    if path == "/module/func":
        print("function definition:" + exports[get_atom_value( nodes[1] )] )

    if path == "/module/type" and get_atom_value( nodes[2][0] ) == "func":
        declared_funcs[get_atom_value( nodes[1] )] = parse_function_declaration(nodes[2])
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
    sexp = loads(data, nil='nop', true='1', false='0', line_comment='#')
    print_list(sexp, "/" + get_atom_value(sexp[0]))
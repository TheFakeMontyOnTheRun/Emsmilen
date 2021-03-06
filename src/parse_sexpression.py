from sexpdata import loads, Symbol
import sys

from emit_smilebasic import *

end_of_literals = 0

operands_per_instructions = {
    "i32.load8_s": 0,
    "i32.load8_u": 0,
    "i32.load16_s": 0,
    "i32.load16_u": 0,
    "i64.load8_s": 0,
    "i64.load8_u": 0,
    "i64.load16_s": 0,
    "i64.load16_u": 0,
    "i64.load32_s": 0,
    "i64.load32_u": 0,
    "f64.store": 0,
    "f32.store": 0,
    "i32.get": 1,
    "local.get": 1,
    "i32.const": 1,
    "i64.const": 1,
    "i32.add": 0,
    "global.get": 1,
    "i32.sub": 0,
    "block": 1,
    "i32.le_s": 0,
    "func": 1,
    "end": 0,
    "f64.const": 1,
    "i32.le_u": 0,
    "i32.gt_u": 0,
    "i32.gt_s": 0,
    "i32.ge_u": 0,
    "i32.ge_s": 0,
    "i32.load": 0,
    "i64.load": 0,
    "i32.and": 0,
    "i32.lt_u": 0,
    "i32.lt_s": 0,
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
    "f32.store": 0,
    "i32.store8": 0,
    "i32.store16": 0,
    "i64.store": 0,
    "i64.store8": 0,
    "i64.store16": 0,
    "i64.store32": 0,
    "f64.store": 0,
    "grow_memory": 0,
    "current_memory": 0,
    "select": 0,
    "if": 0,
    "else": 0,
    "loop": 1,
    "drop": 0,
    "return": 0,
    "memory.grow": 0,
    "unreachable": 0,
    "local.tee": 1,
    "tee_local": 1,
    "local.set": 1,
    "set_local": 1,
    "br": 1,
    "call": 1,
    "br_if": 1,
    "global.set": 1,
    "get_local": 1
}

instruction_emitters = {
    "i32.load8_u": emit_i32_load8_u,
    "i32.load8_s": emit_i32_load8_s,
    "i32.load16_u": emit_i32_load16_u,
    "i32.load16_s": emit_i32_load16_s,
    "i64.load8_u": emit_i32_load8_u,
    "i64.load8_s": emit_i32_load8_s,
    "i64.load16_u": emit_i32_load16_u,
    "i64.load16_s": emit_i32_load16_s,
    "i64.load8_u": emit_i32_load8_u,
    "i64.load8_s": emit_i32_load8_s,
    "f32.store": emit_i32_store,
    "f64.store": emit_i64_store,
    "grow_memory": emit_unsupported,
    "current_memory": emit_current_memory,
    "i32.get": emit_i32_get,
    "local.get": emit_local_get,
    "get_local": emit_local_get,
    "i32.const": emit_i32_const,
    "i64.const": emit_i64_const,
    "f64.const": emit_i64_const,
    "i32.add": emit_i32_add,
    "global.get": emit_global_get,
    "i32.sub": emit_i32_sub,
    "block": emit_block,
    "i32.le_s": emit_i32_le_u,
    "end": emit_end,
    "i32.le_u": emit_i32_le_u,
    "i32.gt_u": emit_i32_gt_u,
    "i32.gt_s": emit_i32_gt_u,
    "i32.ge_u": emit_i32_ge_u,
    "i32.ge_s": emit_i32_ge_u,
    "i32.load": emit_i32_load,
    "i64.load": emit_i64_load,
    "i32.and": emit_i32_and,
    "i32.lt_u": emit_i32_lt_u,
    "i32.lt_s": emit_i32_lt_u,
    "i32.shr_u": emit_i32_shr_u,
    "i32.shl": emit_i32_shl,
    "offset=": emit_offset,
    "align=": emit_align,
    "i32.xor": emit_i32_xor,
    "i32.eq": emit_i32_eq,
    "i32.eqz": emit_i32_eqz,
    "i32.ne": emit_i32_ne,
    "i32.or": emit_i32_or,
    "i32.rotl": emit_i32_rotl,
    "f32.store": emit_i32_store,
    "i32.store": emit_i32_store,
    "i32.store8": emit_i32_store,
    "i32.store16": emit_i32_store,
    "i64.store": emit_i64_store,
    "i64.store8": emit_i64_store,
    "i64.store16": emit_i64_store,
    "i64.store32": emit_i64_store,
    "f64.store": emit_i64_store,
    "select": emit_select,
    "if": emit_if,
    "else": emit_else,
    "loop": emit_loop,
    "drop": emit_drop,
    "return": emit_return,
    "memory.grow": emit_memory_grow,
    "unreachable": emit_unreachable,
    "local.tee": emit_local_tee,
    "tee_local": emit_local_tee,
    "local.set": emit_local_set,
    "set_local": emit_local_set,
    "br": emit_br,
    "call": emit_call,
    "br_if": emit_br_if,
    "global.set": emit_global_set,
}


class ValueTypeDefinition:
    name = None
    TypeName = None


class FunctionType:
    parameters = []
    returnType = None


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
            if is_list(node):
                for type_name in node:
                    if type_name[0] == "$":
                        param_list.append(get_atom_value(type_name))
            elif get_atom_value(node)[0] != "$":
                param_list.append(get_atom_value(node))

    return param_list


def parse_parameters_definition(func_node):
    if not function_has_parameters(func_node):
        emit_empty_param_list()
        return

    emit_parameter_list_start()

    for node in func_node:
        if is_list(node) and len(node) > 0:
            if get_atom_value(node[0]) == "param":
                for token in node:
                    atom_value = get_atom_value(token)
                    if atom_value[0] == "$":
                        emit_parameter_definition("L" + atom_value)

    emit_parameter_list_end()


def parse_function_declaration(type_def):
    func = FunctionType()

    for node in type_def:
        if is_list(node) and len(node) > 0:
            if get_atom_value(node[0]) == "param":
                func.parameters = parse_parameter_declaration(node)

            if get_atom_value(node[0]) == "result":
                func.returnType = parse_result_declaration(node)

    return func


def parameters_size(functype):
    total = 0

    for param in functype.parameters:
        total += 4 if param == "i32" else 8

    return total


def do_nothing_for_now():
    bla = 0


def emit_diagnostics():
    print("PRINT \"**\";")
    print("PRINT \"TOP:\";")
    print("PRINT TOP;")
    print("PRINT \" STACK TOP:\";")
    print("PRINT STACK[TOP]")


def parse(instruction):
    if instruction[0] in instruction_emitters:
        # print()
        # print()
        # sys.stdout.write("PRINT\">")
        #
        # for operand in instruction:
        #     sys.stdout.write(operand + " ")
        #
        # print("<\"")
        # emit_diagnostics()
        # print()
        instruction_emitters[instruction[0]](instruction)


def function_has_parameters(func_node):
    for node in func_node:
        if is_list(node) and len(node) > 0:
            if get_atom_value(node[0]) == "param":
                return True

    return False


def generate_function(func_node):
    func_type = None
    buffered_nodes = []
    pending_operands = 0
    func_name = get_atom_value(func_node[1])
    emit_func(["func", func_name])

    parse_parameters_definition(func_node)

    function_types[func_name] = parse_function_declaration(func_node)

    index = 0
    for node in func_node:
        index = index + 1
        if is_list(node) and len(node) > 0:
            if get_atom_value(node[0]) == "param":
                continue
            elif get_atom_value(node[0]) == "result":

                if func_type is None:
                    func_type = FunctionType()

                func_type.returnType = parse_result_declaration(node)

            elif get_atom_value(node[0]) == "type":
                func_index = get_atom_value(node[1])

                if func_index in declared_func_types:
                    func_type = declared_func_types[func_index]

                function_types[func_name] = func_type

            elif get_atom_value(node[0]) == "local":
                emit_local_declaration(get_atom_value(node[1]))

            elif get_atom_value(node[0]).startswith(";"):
                continue
            else:
                print(get_atom_value(node))
        else:
            atom_value = get_atom_value(node)

            if atom_value.startswith(";"):
                print("Line comments are not supported for now - sorry")
                exit(-1)

            if len(buffered_nodes) == 0:
                if atom_value not in operands_per_instructions:
                    print("instruction not handled: " + atom_value)
                    exit(-1)

                pending_operands = operands_per_instructions[atom_value]
                buffered_nodes.append(atom_value)
            else:
                pending_operands = pending_operands - 1
                buffered_nodes.append(atom_value)

            if pending_operands == 0:

                if buffered_nodes[0] == "block":
                    scope_stack.append([buffered_nodes[0], buffered_nodes[1]])
                elif buffered_nodes[0] == "if":
                    scope_stack.append([buffered_nodes[0], buffered_nodes[1]])
                elif buffered_nodes[0] == "loop":
                    scope_stack.append([buffered_nodes[0], buffered_nodes[1]])
                elif buffered_nodes[0] == "else":
                    scope_top = scope_stack.pop()
                    scope_stack.append([buffered_nodes[0], buffered_nodes[1]])

                parse(buffered_nodes)

                if buffered_nodes[0] == "end":
                    scope_top = scope_stack.pop()

                buffered_nodes = []

    emit_end_function(func_node, func_type)


def print_list(nodes, path):
    global end_of_literals

    if path == "/module/export":
        exports[get_atom_value(get_atom_value(nodes[2]))] = get_atom_value(nodes[1])

    if path == "/module/import":
        exported_func_name = get_atom_value(nodes[2])
        if exported_func_name == "__linear_memory":
            emit_memory( int(get_atom_value(nodes[3][2])) )

        elif exported_func_name == "__indirect_function_table":
            print("REM TABLE INDIRECTIONS NOT SUPPORTED YET")

        else:
            imports["$" + get_atom_value(nodes[1]) + "." + get_atom_value(nodes[2])] = exported_func_name
            function_types[exported_func_name] = declared_func_types[get_atom_value(nodes[3][2][1])]

    if path == "/module/data":
        literal = ""
        for subnode in nodes:
            if is_list(subnode):
                starting_address = get_atom_value(subnode[1])
            if isinstance(subnode, str):
                literal = subnode
        end_of_literals = int(starting_address) +  emit_string_at_address(int(starting_address), literal)

    if path == "/module/func":
        func_def = get_atom_value(nodes[1])

        #        if func_def in exports:
        #            print("function definition:" + exports[func_def])

        generate_function(nodes)
        return

    if path == "/module/type" and get_atom_value(nodes[2][0]) == "func":
        declared_func_types[get_atom_value(nodes[1])] = parse_function_declaration(nodes[2])
        return

    for node in nodes:

        if nodes.index(node) != 0:

            if is_list(node) and len(node) > 0:
                newPath = path + "/" + get_atom_value(node[0])

                print_list(node, newPath)


#           else:
#                print(path + "/" + get_atom_value(node))

with open('simple.dis', 'r') as myfile:
    data = myfile.read()
    sexp = loads(data, nil='nop', true='true', false='false', line_comment=";;")
    print_list(sexp, "/" + get_atom_value(sexp[0]))

    if "puts" in imports.values():
        emit_puts()

    if "strlen" in imports.values():
        emit_strlen()

    if "putchar" in imports.values():
        emit_putchar()

    print("MEMORY[" + str(end_of_literals + 1) + "] = 1")
    emit_string_at_address( end_of_literals + 2, "simple.dis\0")

    if "main" in exports.values():
        ivd = {v: k for k, v in exports.items()}
        print("PRINT " + filter_func_name(ivd["main"]) + "( 1, " + str (end_of_literals + 2 ) + ", 0 )")

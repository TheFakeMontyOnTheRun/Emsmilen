import sys


def emit_i32_load8_u(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS] AND 256)")

def emit_i32_load8_s(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS] AND 256)")


def emit_i32_get(data):
    print()


def emit_func(data):
    sys.stdout.write("DEF F_" + data[1].replace("$", ""))


def emit_local_get(data):
    print("STACK[TOP + 1] = L" + data[1] + "\nTOP = TOP + 1")


def emit_i32_const(data):
    print()


def emit_i64_const(data):
    print()


def emit_i32_add(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = AX + BX\nTOP = TOP - 1")


def emit_global_get(data):
    print()


def emit_i32_sub(data):
    print()


def emit_block(data):
    print()


def emit_end(data):
    print()


def emit_i32_le_u(data):
    print()


def emit_i32_gt_u(data):
    print()


def emit_i32_ge_u(data):
    print()


def emit_i32_load(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = MEMORY[MEMORY_ADDRESS]")


def emit_i64_load(data):
    print()


def emit_i32_and(data):
    print()


def emit_i32_lt_u(data):
    print()


def emit_i32_shr_u(data):
    print()


def emit_i32_shl(data):
    print()


def emit_offset(data):
    print()


def emit_align(data):
    print()


def emit_i32_xor(data):
    print()


def emit_i32_eq(data):
    print()


def emit_i32_eqz(data):
    print()


def emit_i32_ne(data):
    print()


def emit_i32_or(data):
    print()


def emit_i32_rotl(data):
    print()


def emit_i32_store(data):
    print()


def emit_i64_store(data):
    print()


def emit_select(data):
    print()


def emit_if(data):
    print()


def emit_else(data):
    print()


def emit_loop(data):
    print()


def emit_drop(data):
    print()


def emit_return(data):
    print()


def emit_memory_grow(data):
    print()


def emit_unreachable(data):
    print()


def emit_local_tee(data):
    print()


def emit_local_set(data):
    print()


def emit_br(data):
    print()


def emit_call(data):
    print()


def emit_br_if(data):
    print()


def emit_global_set(data):
    print()

def emit_end_function(data, func_type ):
    if func_type is not None and func_type.returnType is not None:
        print("RETURN STACK[TOP]")
    print("END")

def emit_memory():
    print("DIM MEMORY[1024 * 64]\nDIM MEMORY_ADDRESS")

def emit_empty_param_list():
    print("()\nDIM STACK[128]\nDIM TOP\nDIM AX\nDIM BX")

def emit_parameter_list(params_without_param_token):
    sys.stdout.write("(")
    index = 0

    for param in params_without_param_token:
        sys.stdout.write("L" + str(index) )
        index = index + 1

        if index < len(params_without_param_token):
            sys.stdout.write(", ")
        else:
            print(")\nDIM STACK[128]\nDIM TOP")
from sexpdata import loads


def is_list(possible_list):
    att = dir(possible_list)

    if isinstance(possible_list, str):
        return False

    for i in att:
        if i is "__len__":
            return True

    return False


def print_list(nodes):
    for node in nodes:
        if is_list(node) and len(node) > 0:
            print_list(node)
        else:
            print(str(node))


with open('hello.dis', 'r') as myfile:
    data = myfile.read()
    sexp = loads(data, nil='nop', true='1', false='0', line_comment='#')
    print_list(sexp)

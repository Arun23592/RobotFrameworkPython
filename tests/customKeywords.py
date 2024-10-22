from robot.api.deco import keyword


@keyword
def append_to_list(original_list, item):
    # This function appends an item to the list
    original_list.append(item)
    return original_list

local sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)

return {
    sep = sep,
}

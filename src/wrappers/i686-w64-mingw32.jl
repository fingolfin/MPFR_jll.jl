# Autogenerated wrapper script for MPFR_jll for i686-w64-mingw32
export libmpfr

using GMP_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libmpfr`
const libmpfr_splitpath = ["bin", "libmpfr-6.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmpfr_path = ""

# libmpfr-specific global declaration
# This will be filled out by __init__()
libmpfr_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmpfr = "libmpfr-6.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"MPFR")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (GMP_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (GMP_jll.LIBPATH_list,))

    global libmpfr_path = normpath(joinpath(artifact_dir, libmpfr_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmpfr_handle = dlopen(libmpfr_path)
    push!(LIBPATH_list, dirname(libmpfr_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()


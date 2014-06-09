#******************************************************************************
# CleanAll                                                                    #
#                                                                             #
# 	Recursively builds the Clean target in the current directory and all  #
# 	subdirectories that contain a .csproj file. Note that MSBuild must be #
# 	included in your PATH environment variable. For VS2013, you will need #
#	to ensure the proper MSBuild is included in the PATH in order to      #
#	clean any projects referencing Microsoft.WebApplication.targets:      #
#                                                                             #
#		C:\Program Files\MSBuild\12.0\Bin for 32-bit machines,        #
#		C:\Program Files (x86)\MSBuild\12.0\Bin for 64-bit machines   #
#                                                                             #
#******************************************************************************

Get-ChildItem -Path .\ -Recurse -Filter *.csproj | `
Foreach-Object {
	MSBuild $_.FullName /t:Clean
	Start-Sleep -Milliseconds 15
}

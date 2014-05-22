Get-ChildItem -Path .\ -Recurse -Filter *.csproj | `
Foreach-Object {
	msbuild $_.FullName /t:Clean
}

#C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe [path]\[project].csproj /t:Clean
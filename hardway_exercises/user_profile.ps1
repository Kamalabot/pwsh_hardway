#Prompt
Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt Paradox
#Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
function yt64 { 
	[CmdLetBinding()] 
	param(
		[Parameter()]
		[string]
		$url
	)
	begin{
		write-output "$url"
	}
	process {
		$output = & D:\python_installs\Scripts\yt-dlp.exe -f 136+140 $url
	}
	end {
		write-output "done"
	}
}

function yt54 { 
	[CmdLetBinding()] 
	param(
		[Parameter()]
		[string]
		$url
	)
	begin{
		write-output "$url"
	}
	process {

		$output = & D:\python_installs\Scripts\yt-dlp.exe -f 135+140 $url
	}
	end {
		write-output "done"
	}
}

function yt64pl { 
	[CmdLetBinding()] 
	param(
		[Parameter()]
		[string]
		$url
	)
	begin{
		write-output "$url"
	}
	process {
		$output = & D:\python_installs\Scripts\yt-dlp.exe -f 136+140 --yes-playlist $url
	}
	end {
		write-output "done"
	}
}

function yt54pl { 
	[CmdLetBinding()] 
	param(
		[Parameter()]
		[string]
		$url
	)
	begin{
		write-output "$url"
	}
	process {
		$output = & D:\python_installs\Scripts\yt-dlp.exe -f 135+140 --yes-playlist $url
	}
	end {
		write-output "done"
	}
}

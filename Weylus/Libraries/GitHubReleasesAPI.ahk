; removed prerelease, and shortened. https://github.com/Ixiko/AHK-libs-and-classes-collection/blob/master/libs/g-n/GIThubReleasesAPI.ahk
GetLatestRelease_Version(user, repo) {
	Try {
		httpReq := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		httpReq.SetTimeouts("10000", "10000", "10000", "10000")

		httpReq.Open("GET", "https://api.github.com/repos/" user "/" repo "/releases/latest", True)

		httpReq.Send()
		httpReq.WaitForResponse(10)

		releasesJSON := httpReq.ResponseText
		parsedJSON := JSON.Load(releasesJSON)

		releaseInfos := parsedJSON
	}

	Catch e {
		MsgBox, 16,, % "Exception thrown!`n`nwhat: " e.what "`nfile: " e.file
        . "`nline: " e.line "`nmessage: " e.message "`nextra: " e.extra
	}
	return releaseVersion := releaseInfos.name
}
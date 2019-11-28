#===================================================
#
# 동영상 파일 오디오 코덱 변경 자동화 (dts -> ac3)
#
#===================================================

ECHO OFF

# ffmpeg 실행파일 경로
D:
$path_exe = "D:\dev\99_download\ffmpeg-20190730-b3b7523-win64-shared\bin\"

cd $path_exe


# 대상파일 확장자
$ext = "*.mkv", '*.mp4'
# 검색 대상 경로 (하위폴더 모두 포함하여 검색)
$path = "D:\dev\99_download\ffmpeg-20190730-b3b7523-win64-shared\bin\"

$filelist = Get-ChildItem $path -include $ext -Recurse | Select-Object -Expand FullName

For($j=0; $j -lt $filelist.Length; $j++) {

    $path_in = $filelist[$j]
    $path_out = $path_in.Replace(".mkv", "_forsamsung.mkv")
    $path_out = $path_out.Replace(".mp4", "_forsamsung.mp4")

    # add ac3
    #.\ffmpeg.exe -i $path_in -map 0:0 -map 0:1 -map 0:1 -c:v copy  -c:a:0 copy -c:a:1 ac3 -ac 6 -b:a:1 640k $path_out

    # replace only dts to ac3
    \.ffmpeg.exe -i $path_in -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k $path_out

}

"Complete"
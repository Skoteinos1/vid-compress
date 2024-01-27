# It merges videos specified in mergelist.txt
ffmpeg -f concat -safe 0 -i mergelist.txt -c copy output.mkv
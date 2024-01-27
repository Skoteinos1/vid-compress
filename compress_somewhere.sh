foo="/TARGET/FOLDER/"

# 1 prints list of files
# 2 Simplified version of point 4
# 3 Compresses videos: Codec hevc, few examples included how you can edit end result
# 4 Test. It tries couple variants, so you can compare results
# 5 Scales videos
# 6 Probe. It will tell you which codecs were used to create video you want to work on
# 7 Trim - It will trim whole folder, so make sure there is only 1 video. You can pick your start and end times by -ss 00:12:34 -to 01:23:47
# 8 for Davinci Resolve
# 9 for Insta

bar=3

if [ $bar -eq 1 ]
then
    find "$foo" -name "*.avi" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.flv" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.MP4" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.MOV" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.wmv" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.mpg" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.mpeg" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.m4v" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.mp4" -exec bash -c 'echo $0' {} \;
    find "$foo" -name "*.mov" -exec bash -c 'echo $0' {} \;
    # find "$foo" -name "*.mkv" -exec bash -c 'echo $0' {} \;
elif [ $bar -eq 2 ]
then
    # find "$foo" -name "*.mov" -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a libopus "${0%.*}.mkv"' {} \;
    # find "$foo" -name "*.mov" -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a copy "${0%.*}.mkv"' {} \;
    find "$foo" -name "*.avi" -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a copy "${0%.*}.mp4"' {} \;
elif [ $bar -eq 3 ]
then

find "$foo" \( -name "*.XXXX" \
 -o -name "*.mov" \
 -o -name "*.avi" \
 -o -name "*.gif" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MKV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v hevc -preset veryfast -c:a copy "${0%.*}.mkv"' {} \;

# -c:v copy
# -c:v libx265 -preset medium -x265-params crf=24
# -c:v hevc -preset veryfast
# -c:v h264

# -c:a copy
# -acodec pcm_s16be -q:a 0
# -c:a libopus -b:a 128K
# -c:a libopus

elif [ $bar -eq 4 ]
then

find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'echo $0' {} \;
#  -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a libopus -b:a 128K -t 120 "${0%.*} opus128.mkv"' {} \;

find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a libopus -t 120 "${0%.*} opus.mkv"' {} \;

find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a copy -t 120 "${0%.*} copy.mkv"' {} \;

find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v hevc -preset veryfast -c:a copy -t 120 "${0%.*} hevc vf.mkv"' {} \;

find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'echo $0' {} \;
#  -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v libx265 -preset medium -x265-params crf=24 -c:a copy -t 120 "${0%.*} 265med.mkv"' {} \;

#  -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v hevc -preset veryfast -c:a copy -t 120 "${0%.*} hevc.mkv"' {} \;
#  -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v libx265 -preset medium -x265-params crf=24 -c:a copy -t 120 "${0%.*} 265.mkv"' {} \;
# -exec bash -c 'echo $0' {} \;

elif [ $bar -eq 5 ]
then
#   ffmpeg -i "Untitled.mov" -vf "scale=640:400" -map 0 output.mp4
#   ffmpeg -i "Untitled.mov" -vf "scale=768:432:force_original_aspect_ratio=decrease,pad=768:432:-1:-1:color=black" -map 0 output.m4v
#   ffmpeg -i "Untitled.mov" -vf scale=1280:720 -preset slow -crf 18 output.mp4
  ffmpeg -i "Untitled.mov" -vf scale=768:432 -preset slow -crf 18 output.mp4

elif [ $bar -eq 6 ]
then
# probe
find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.3gp" \
 -o -name "*.mkv" \
 -o -name "*.mov" \
 -o -name "*.mp4" \
 -o -name "*.MTS" \
\) \
 -exec bash -c 'ffprobe -i "$0" -hide_banner; printf "\n-----\n\n";' {} \;

# Old version:
# for i in *.mkv; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.mov; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.mp4; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.m4v; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.mpg; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.avi; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.flv; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.wmv; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done
# for i in *.swf; do ffprobe -i "$i" -hide_banner; echo '\n-----\n'; done

elif [ $bar -eq 7 ]
then
# Trim
find "$foo" \( -name "*.XXXX" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.3gp" \
 -o -name "*.mkv" \
 -o -name "*.mov" \
 -o -name "*.mp4" \
\) \
-exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a copy -to 00:1:58 "${0%.*} trim.mkv"' {} \;
#  -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a copy -t 00:03:14 "${0%.*} trim.mkv"' {} \;
#  -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -c:v copy -c:a copy -ss 01:00:00 -to 01:07:00 "${0%.*} trim.flv"' {} \;

elif [ $bar -eq 8 ]
then
# Davinci Resolve
mkdir transcoded;
find "$foo" \( -name "*.XXXX" \
 -o -name "*.mov" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.3gp" \
 -o -name "*.mkv" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -vcodec mpeg4 -q:v 5 -acodec pcm_s16be -q:a 0 -f mov "${0%.*}.mov"' {} \;

elif [ $bar -eq 9 ]
then
# Insta
find "$foo" \( -name "*.XXXX" \
 -o -name "*.mov" \
 -o -name "*.avi" \
 -o -name "*.flv" \
 -o -name "*.MP4" \
 -o -name "*.MOV" \
 -o -name "*.wmv" \
 -o -name "*.3gp" \
 -o -name "*.mpeg" \
 -o -name "*.mpg" \
 -o -name "*.m4v" \
 -o -name "*.3gp" \
 -o -name "*.mkv" \
 -o -name "*.mp4" \
\) \
 -exec bash -c 'ffmpeg -i "$0" -nostats -hide_banner -vcodec mpeg4 -q:v 5 -acodec pcm_s16be -q:a 0 -f mov "${0%.*}.mp4"' {} \;

fi

spd-say 'job done'

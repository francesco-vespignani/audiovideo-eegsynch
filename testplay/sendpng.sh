###
#  only video:
#  ./sendpng.sh | ffmpeg  -framerate 100 -f image2pipe -i -  -c:v libx264 -crf 0 singleshot.mkv
###
#  mono audio:
#  ./sendpng.sh | ffmpeg  -framerate 100 -f image2pipe -i - -i soundM.flac -c:a copy -c:v libx264 -crf 0 singleshotAM.mkv
###
#  mono audio and trigger:
#  ./sendpng.sh | ffmpeg  -framerate 100 -f image2pipe -i - -i soundMT.flac -c:a copy -c:v libx264 -crf 0 singleshotAMT.mkv
###
seq 1 100 | xargs -Inone cat blank.png
seq 1 20 | xargs -Inone cat spot.png
seq 1 80 | xargs -Inone cat blank.png



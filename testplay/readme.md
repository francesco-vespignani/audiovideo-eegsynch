# Test video for checking diplay performances

The aim is building a video in lossless audio/video encoding:
- container [martiosca](https://www.matroska.org/index.html) (.mkv)
- audio [flac](https://xiph.org/flac/) lossless, 44100Hz, 16 bit depth
- video fullHD (1920x1080) at 100fps, [H.264](https://en.wikipedia.org/wiki/Advanced_Video_Coding) lossless (crf 0) ecoding

The  sample (singleshotAMT.mkv) is a 2s movies with a 1s blank, followed by a syncronized
audio-video spot of 0.2s with additional audio-trigger channel (see below)

A sequence of 20 single shopt is in sequenceAMT.mkv

## Description of the content

### Frames 

blank.svg and shot.svg have been created from scratch and then converted to png with cairosvg:

> cairosvg blank.svg  > blank.png

> cairosvg shot.svg  > shot.png

### Audio

Different audio files with a beep can be created with createFlac.m in matlab
audio is 44100 Hz and 16bit depth, format lossless flac

- soundM.flac  beep on ch1
- soundMT.flac beep on ch1, trigger (square wave) of ch2
- soundS.flac  beep on ch1 and ch2
- soundMT.flac beep on ch1 and ch2, trigger (square wave) of ch2

### Video

Videos are created with [ffmpeg](http://ffmpeg.org), using tutorials of the [ffmpeg wiki](https://trac.ffmpeg.org/)

The file sendpg.sh is a shell command that pipes multiple frames into ffmeg, to create
the video use the linux command:

> ./sendpng.sh | ffmpeg  -framerate 100 -f image2pipe -i - -i soundMT.flac -c:a copy -c:v libx264 -crf 0 singleshotAMT.mkv

Using different audio files (above) would allow to create different movies.

To buil a 20 times sequence of the same video use the linux command:

> ffmpeg -f concat -i mylist.txt -c copy sequenceAMT.mkv







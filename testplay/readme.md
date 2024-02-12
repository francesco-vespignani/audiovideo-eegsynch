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

- soundM.flac
-
-
-

the file sendpg.sh is a shell command that pipes multiple frames int ffmeg, us

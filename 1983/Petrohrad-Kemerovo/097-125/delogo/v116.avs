import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v116, audio_rate = 48000, channels = 2).killVideo
v116 = v116.audioDub(va)

last = v116
prefetch


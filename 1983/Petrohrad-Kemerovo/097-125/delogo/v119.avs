import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v119, audio_rate = 48000, channels = 2).killVideo
v119 = v119.audioDub(va)

last = v119
prefetch


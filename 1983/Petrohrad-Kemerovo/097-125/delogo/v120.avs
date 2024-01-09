import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v120, audio_rate = 48000, channels = 2).killVideo
v120 = v120.audioDub(va)

last = v120
prefetch


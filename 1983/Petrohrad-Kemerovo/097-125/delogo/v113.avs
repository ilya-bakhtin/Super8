import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v113, audio_rate = 48000, channels = 2).killVideo
v113 = v113.audioDub(va)

last = v113
prefetch


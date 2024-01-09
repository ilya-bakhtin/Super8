import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

last = v121
prefetch


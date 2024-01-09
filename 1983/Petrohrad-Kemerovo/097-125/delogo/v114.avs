import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v114, audio_rate = 48000, channels = 2).killVideo
v114 = v114.audioDub(va)

last = v114
prefetch


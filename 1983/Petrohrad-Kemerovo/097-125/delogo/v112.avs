import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

last = v112
prefetch


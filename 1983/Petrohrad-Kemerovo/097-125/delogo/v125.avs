import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v125, audio_rate = 48000, channels = 2).killVideo
v125 = v125.audioDub(va)

last = v125
prefetch


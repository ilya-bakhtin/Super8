import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v108, audio_rate = 48000, channels = 2).killVideo
v108 = v108.audioDub(va)

last = v108
prefetch


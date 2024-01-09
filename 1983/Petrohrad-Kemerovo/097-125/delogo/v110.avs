import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v110, audio_rate = 48000, channels = 2).killVideo
v110 = v110.audioDub(va)

last = v110
prefetch


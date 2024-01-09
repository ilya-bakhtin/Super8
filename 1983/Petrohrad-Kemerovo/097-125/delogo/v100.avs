import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

last = v100
prefetch


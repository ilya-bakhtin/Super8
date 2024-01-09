import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v118, audio_rate = 48000, channels = 2).killVideo
v118 = v118.audioDub(va)

last = v118
prefetch


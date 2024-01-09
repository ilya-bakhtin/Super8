import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v99, audio_rate = 48000, channels = 2).killVideo
v99 = v99.audioDub(va)

last = v99
prefetch


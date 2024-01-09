import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo
v105 = v105.audioDub(va)

last = v105
prefetch


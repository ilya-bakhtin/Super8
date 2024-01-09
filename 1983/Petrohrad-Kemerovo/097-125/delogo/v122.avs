import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v122, audio_rate = 48000, channels = 2).killVideo
v122 = v122.audioDub(va)

last = v122
prefetch


import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v97, audio_rate = 48000, channels = 2).killVideo
v97 = v97.audioDub(va)

last = v97
prefetch


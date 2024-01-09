import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v111, audio_rate = 48000, channels = 2).killVideo
v111 = v111.audioDub(va)

last = v111
prefetch


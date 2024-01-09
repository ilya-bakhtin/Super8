import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v123, audio_rate = 48000, channels = 2).killVideo
v123 = v123.audioDub(va)

last = v123
prefetch


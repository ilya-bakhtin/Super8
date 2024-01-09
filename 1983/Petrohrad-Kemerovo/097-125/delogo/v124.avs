import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v124, audio_rate = 48000, channels = 2).killVideo
v124 = v124.audioDub(va)

last = v124
prefetch


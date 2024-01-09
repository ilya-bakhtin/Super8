import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v106, audio_rate = 48000, channels = 2).killVideo
v106 = v106.audioDub(va)

last = v106
prefetch


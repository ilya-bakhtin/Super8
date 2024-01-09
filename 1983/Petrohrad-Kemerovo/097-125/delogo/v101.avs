import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101.audioDub(va)

last = v101
prefetch


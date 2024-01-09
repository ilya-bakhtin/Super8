import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v109, audio_rate = 48000, channels = 2).killVideo
v109 = v109.audioDub(va)

last = v109
prefetch


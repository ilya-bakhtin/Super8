import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v107, audio_rate = 48000, channels = 2).killVideo
v107 = v107.audioDub(va)

last = v107
prefetch


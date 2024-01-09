import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v117, audio_rate = 48000, channels = 2).killVideo
v117 = v117.audioDub(va)

last = v117
prefetch


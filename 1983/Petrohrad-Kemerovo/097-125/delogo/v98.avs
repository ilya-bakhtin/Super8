import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v98, audio_rate = 48000, channels = 2).killVideo
v98 = v98.audioDub(va)

last = v98
prefetch


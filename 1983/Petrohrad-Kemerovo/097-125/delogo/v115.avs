import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v115, audio_rate = 48000, channels = 2).killVideo
v115 = v115.audioDub(va)

last = v115
prefetch


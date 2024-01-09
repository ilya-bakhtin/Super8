import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo
v102 = v102.audioDub(va)

last = v102
prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")
v81 = LSMASHVideoSource(dst_dir + "v81rc.mp4")

v81 = v81.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v81 = v81.convertToYV12(interlaced=false)

v81 = v81.UnsharpMask(strength=500, radius=5, threshold=1)
v81 = v81.adjustBorders

va = BlankClip(v81, audio_rate = 48000, channels = 2).killVideo
v81 = v81.audioDub(va)

return v81.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v33 = LSMASHVideoSource(dst_dir + "v33rc.mp4")

v33 = v33.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v33 = v33.convertToYV12(interlaced=false)

v33 = v33.UnsharpMask(strength=500, radius=5, threshold=1)
v33 = v33.adjustBorders

va = BlankClip(v33, audio_rate = 48000, channels = 2).killVideo
v33 = v33.audioDub(va)

return v33.Prefetch


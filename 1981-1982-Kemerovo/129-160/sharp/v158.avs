import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v158 = LSMASHVideoSource(dst_dir + "v158rc.mp4")

v158 = v158.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v158 = v158.convertToYV12(interlaced=false)

v158 = v158.UnsharpMask(strength=500, radius=5, threshold=1)
v158 = v158.adjustBorders

va = BlankClip(v158, audio_rate = 48000, channels = 2).killVideo
v158 = v158.audioDub(va)

return v158.Prefetch


import("..\common.avs")
import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
v15 = LSMASHVideoSource(dst_dir + "v15rc.mp4")

v15 = v15.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v15 = v15.convertToYV12(interlaced=false)

v15 = v15.UnsharpMask(strength=500, radius=5, threshold=1)
v15 = v15.adjustBorders

v15 = v15.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 240)

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

return v15.Prefetch


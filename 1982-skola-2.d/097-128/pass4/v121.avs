LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v121 = LSMASHVideoSource(dst_dir + "v121rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v121f.mp4")
v121 = ImageSource(file = dst_dir + "v121-png\v121-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v121 = v121.convertToY.adjustSize

#v121 = v121.extractY.convertToYV12(interlaced=false)
#v121 = v121.deScratch.extractY

v121 = v121.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v121 = v121.convertBits(8).convertToYV12(interlaced=false)

v121 = v121.deScratch.extractY
v121 = v121.removeDirt
v121 = v121.convertToYV12(interlaced=false)
v121 = v121.UnsharpMask(strength=400, radius=5, threshold=1)
v121 = v121.adjustBorders
#v121 = v121.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v121 = v121.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

return v121.Prefetch


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v152 = LSMASHVideoSource(dst_dir + "v152rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v152f.mp4")
v152 = ImageSource(file = dst_dir + "v152-png\v152-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v152 = v152.convertToY.adjustSize

#v152 = v152.extractY.convertToYV12(interlaced=false)
#v152 = v152.deScratch.extractY

v152 = v152.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v152 = v152.convertBits(8).convertToYV12(interlaced=false)

v152 = v152.deScratch.extractY
v152 = v152.removeDirt
v152 = v152.convertToYV12(interlaced=false)
v152 = v152.UnsharpMask(strength=400, radius=5, threshold=1)
v152 = v152.adjustBorders
#v152 = v152.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v152 = v152.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v152, audio_rate = 48000, channels = 2).killVideo
v152 = v152.audioDub(va)

return v152.Prefetch


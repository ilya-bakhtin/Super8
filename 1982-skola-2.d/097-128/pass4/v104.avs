LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v104 = LSMASHVideoSource(dst_dir + "v104rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v104f.mp4")
v104 = ImageSource(file = dst_dir + "v104-png\v104-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v104 = v104.convertToY.adjustSize

#v104 = v104.extractY.convertToYV12(interlaced=false)
#v104 = v104.deScratch.extractY

v104 = v104.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v104 = v104.convertBits(8).convertToYV12(interlaced=false)

v104 = v104.deScratch.extractY
v104 = v104.removeDirt
v104 = v104.convertToYV12(interlaced=false)
v104 = v104.UnsharpMask(strength=400, radius=5, threshold=1)
v104 = v104.adjustBorders
#v104 = v104.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v104 = v104.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v104, audio_rate = 48000, channels = 2).killVideo
v104 = v104.audioDub(va)

return v104.Prefetch


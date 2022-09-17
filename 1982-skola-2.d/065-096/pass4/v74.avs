LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v74 = LSMASHVideoSource(dst_dir + "v74rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v74f.mp4")
v74 = ImageSource(file = dst_dir + "v74-png\v74-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v74 = v74.convertToY.adjustSize

#v74 = v74.extractY.convertToYV12(interlaced=false)
#v74 = v74.deScratch.extractY

v74 = v74.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v74 = v74.convertBits(8).convertToYV12(interlaced=false)

v74 = v74.deScratch.extractY
v74 = v74.removeDirt
v74 = v74.convertToYV12(interlaced=false)
v74 = v74.UnsharpMask(strength=400, radius=5, threshold=1)
v74 = v74.adjustBorders
#v74 = v74.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v74 = v74.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v74, audio_rate = 48000, channels = 2).killVideo
v74 = v74.audioDub(va)

return v74.Prefetch


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v51 = LSMASHVideoSource(dst_dir + "v51rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v51f.mp4")
v51 = ImageSource(file = dst_dir + "v51-png\v51-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v51 = v51.convertToY.adjustSize

#v51 = v51.extractY.convertToYV12(interlaced=false)
#v51 = v51.deScratch.extractY

v51 = v51.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v51 = v51.convertBits(8).convertToYV12(interlaced=false)

v51 = v51.deScratch.extractY
v51 = v51.removeDirt
v51 = v51.convertToYV12(interlaced=false)
v51 = v51.UnsharpMask(strength=400, radius=5, threshold=1)
v51 = v51.adjustBorders
#v51 = v51.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v51 = v51.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v51, audio_rate = 48000, channels = 2).killVideo
v51 = v51.audioDub(va)

return v51.Prefetch


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v87 = LSMASHVideoSource(dst_dir + "v87rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v87f.mp4")
v87 = ImageSource(file = dst_dir + "v87-png\v87-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v87 = v87.convertToY.adjustSize

#v87 = v87.extractY.convertToYV12(interlaced=false)
#v87 = v87.deScratch.extractY

v87 = v87.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v87 = v87.convertBits(8).convertToYV12(interlaced=false)

v87 = v87.deScratch.extractY
v87 = v87.removeDirt
v87 = v87.convertToYV12(interlaced=false)
v87 = v87.UnsharpMask(strength=400, radius=5, threshold=1)
v87 = v87.adjustBorders
#v87 = v87.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v87 = v87.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

return v87.Prefetch


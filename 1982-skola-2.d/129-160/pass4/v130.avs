LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v130 = LSMASHVideoSource(dst_dir + "v130rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v130f.mp4")
v130 = ImageSource(file = dst_dir + "v130-png\v130-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v130 = v130.convertToY.adjustSize

#v130 = v130.extractY.convertToYV12(interlaced=false)
#v130 = v130.deScratch.extractY

v130 = v130.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v130 = v130.convertBits(8).convertToYV12(interlaced=false)

v130 = v130.deScratch.extractY
v130 = v130.removeDirt
v130 = v130.convertToYV12(interlaced=false)
v130 = v130.UnsharpMask(strength=400, radius=5, threshold=1)
v130 = v130.adjustBorders
#v130 = v130.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v130 = v130.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v130, audio_rate = 48000, channels = 2).killVideo
v130 = v130.audioDub(va)

return v130.Prefetch


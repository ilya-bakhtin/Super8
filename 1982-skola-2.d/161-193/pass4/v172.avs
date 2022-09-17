LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v172 = LSMASHVideoSource(dst_dir + "v172rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v172f.mp4")
v172 = ImageSource(file = dst_dir + "v172-png\v172-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v172 = v172.convertToY.adjustSize

#v172 = v172.extractY.convertToYV12(interlaced=false)
#v172 = v172.deScratch.extractY

v172 = v172.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v172 = v172.convertBits(8).convertToYV12(interlaced=false)

v172 = v172.deScratch.extractY
v172 = v172.removeDirt
v172 = v172.convertToYV12(interlaced=false)
v172 = v172.UnsharpMask(strength=400, radius=5, threshold=1)
v172 = v172.adjustBorders
#v172 = v172.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v172 = v172.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v172, audio_rate = 48000, channels = 2).killVideo
v172 = v172.audioDub(va)

return v172.Prefetch

